import { Column, Entity, Index } from "typeorm";

@Index("social_messages_pkey", ["id"], { unique: true })
@Entity("social_messages", { schema: "public" })
export class SocialMessages {
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

  @Column("text", { name: "user_id_from" })
  userIdFrom: string;

  @Column("text", { name: "user_id_to" })
  userIdTo: string;

  @Column("text", { name: "media_uri", nullable: true })
  mediaUri: string | null;

  @Column("text", { name: "message_data", nullable: true })
  messageData: string | null;

  @Column("timestamp without time zone", { name: "send_at", nullable: true })
  sendAt: Date | null;

  @Column("timestamp without time zone", { name: "read_at", nullable: true })
  readAt: Date | null;

  @Column("smallint", { name: "type", nullable: true })
  type: number | null;
}
