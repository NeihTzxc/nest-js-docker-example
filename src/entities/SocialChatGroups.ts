import { Column, Entity, Index, OneToMany } from "typeorm";
import { SocialChatGroupMember } from "./SocialChatGroupMember";
import { SocialChatGroupMessages } from "./SocialChatGroupMessages";

@Index("social_chat_group_pkey", ["id"], { unique: true })
@Entity("social_chat_groups", { schema: "public" })
export class SocialChatGroups {
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

  @Column("text", { name: "name" })
  name: string;

  @Column("bigint", { name: "created_by" })
  createdBy: string;

  @Column("smallint", { name: "status", nullable: true })
  status: number | null;

  @OneToMany(
    () => SocialChatGroupMember,
    (socialChatGroupMember) => socialChatGroupMember.groupChat
  )
  socialChatGroupMembers: SocialChatGroupMember[];

  @OneToMany(
    () => SocialChatGroupMessages,
    (socialChatGroupMessages) => socialChatGroupMessages.group
  )
  socialChatGroupMessages: SocialChatGroupMessages[];
}
