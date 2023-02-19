import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { SocialChatGroups } from "./SocialChatGroups";

@Index("social_group_chat_messages_pkey", ["id"], { unique: true })
@Entity("social_chat_group_messages", { schema: "public" })
export class SocialChatGroupMessages {
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

  @Column("bigint", { name: "user_id_from" })
  userIdFrom: string;

  @Column("text", { name: "media_uri", nullable: true })
  mediaUri: string | null;

  @Column("text", { name: "message_data", nullable: true })
  messageData: string | null;

  @Column("timestamp without time zone", { name: "send_at" })
  sendAt: Date;

  @Column("smallint", { name: "type", nullable: true })
  type: number | null;

  @ManyToOne(
    () => SocialChatGroups,
    (socialChatGroups) => socialChatGroups.socialChatGroupMessages
  )
  @JoinColumn([{ name: "group_id", referencedColumnName: "id" }])
  group: SocialChatGroups;
}
