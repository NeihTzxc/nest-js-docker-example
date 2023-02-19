import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { SocialChatGroups } from "./SocialChatGroups";

@Index("social_group_chat_member_pkey", ["id"], { unique: true })
@Entity("social_chat_group_member", { schema: "public" })
export class SocialChatGroupMember {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("boolean", {
    name: "deleted_flg",
    nullable: true,
    default: () => "false",
  })
  deletedFlg: boolean | null;

  @Column("smallint", { name: "user_id" })
  userId: number;

  @Column("smallint", { name: "role" })
  role: number;

  @Column("bigint", { name: "add_by" })
  addBy: string;

  @Column("timestamp without time zone", {
    name: "last_read_at",
    nullable: true,
  })
  lastReadAt: Date | null;

  @ManyToOne(
    () => SocialChatGroups,
    (socialChatGroups) => socialChatGroups.socialChatGroupMembers
  )
  @JoinColumn([{ name: "group_chat_id", referencedColumnName: "id" }])
  groupChat: SocialChatGroups;
}
